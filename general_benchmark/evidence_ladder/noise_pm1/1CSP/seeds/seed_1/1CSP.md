# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1CSP\seeds\seed_1\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 0.506 A
- tm_score_ca_ordered: 0.968654498425365
- heavy_atom_rmsd: 2.678 A
- sidechain_heavy_atom_rmsd: 3.530 A
- **all-atom quality (honest):** heavy 2.678 A, sidechain 3.530 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1953
- bin_accuracy: 0.648

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5060844703771925
- ga_delta_rmsd: 0.0879718127842255  ga_fitness_mode: energy
- pre_local_rmsd: 0.5184440262384334  localized_anchor_rmsd: 0.5060751290528683

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** D24 → 12 conflicts (40%); F48 → 6 conflicts (20%)
- explained: 18/30 conflicts by 2 root cause(s)
- metrics: hubs=14 (frac 0.215), conflicts/hub=2.1, max_incompat=4.05Å, chain_span=0.8
- **fix-first:** [LOW_CONFLICT] Root cause(s): D24 + F48 — explain ~18/30 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V27** — severity 6.23, 8 conflict(s); suspect input ~`D24` (group: pull_in)
  - pull-in (wants closer): D24@7.1Å(now 9.6,conf 0.37)
  - D24↔S30: targets 7.1/8.0Å but partners are 18.0Å apart → too_far_apart by 3.0Å
  - E35↔D24: targets 15.4/7.1Å but partners are 25.2Å apart → too_far_apart by 2.7Å
  - D24↔I32: targets 7.1/7.6Å but partners are 17.2Å apart → too_far_apart by 2.6Å
- **D24** — severity 3.34, 4 conflict(s); suspect input ~`H28` (group: pull_in)
  - pull-in (wants closer): V27@7.1Å(now 9.6,conf 0.37)
  - H28↔V27: targets 13.8/7.1Å but partners are 3.5Å apart → too_close_together by 3.1Å
  - V27↔F29: targets 7.1/15.9Å but partners are 6.3Å apart → too_close_together by 2.5Å
  - V27↔G21: targets 7.1/8.0Å but partners are 17.3Å apart → too_far_apart by 2.2Å
- **F48** — severity 2.24, 3 conflict(s); suspect input ~`S30` (group: pull_in)
  - pull-in (wants closer): A31@6.5Å(now 9.1,conf 0.39)
  - A31↔S30: targets 6.5/12.6Å but partners are 3.6Å apart → too_close_together by 2.5Å
  - A31↔E20: targets 6.5/11.0Å but partners are 19.7Å apart → too_far_apart by 2.2Å
  - L1↔A31: targets 6.2/6.5Å but partners are 14.4Å apart → too_far_apart by 1.7Å
- **T63** — severity 2.21, 2 conflict(s); suspect input ~`V51` (group: pull_in)
  - pull-in (wants closer): V51@11.9Å(now 14.8,conf 0.34)
  - E52↔V51: targets 19.4/11.9Å but partners are 3.5Å apart → too_close_together by 4.0Å
  - G53↔V51: targets 21.1/11.9Å but partners are 6.8Å apart → too_close_together by 2.5Å
- **A31** — severity 2.04, 2 conflict(s); suspect input ~`L1` (group: pull_in)
  - pull-in (wants closer): F48@6.5Å(now 9.1,conf 0.39)
  - F48↔L1: targets 6.5/15.8Å but partners are 5.4Å apart → too_close_together by 3.9Å
  - F48↔E2: targets 6.5/14.8Å but partners are 6.3Å apart → too_close_together by 2.0Å
- **V51** — severity 1.41, 2 conflict(s); suspect input ~`T63` (group: pull_in)
  - pull-in (wants closer): T63@11.9Å(now 14.8,conf 0.34)
  - K64↔T63: targets 18.4/11.9Å but partners are 4.2Å apart → too_close_together by 2.4Å
  - T63↔N54: targets 11.9/9.9Å but partners are 23.4Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=5 · strand(E)=35 · 3-10(G)=22 · coil(C)=3

```
EEEECEEGGGEGGCEEEGEEHEECEGGEGHHEEEEEGGEEEGGEGGGEGGGGEHEEEEEEGGEHE
```

## Backbone H-bond Network

- total=70 · helix(i→i+4)=0 · sheet=70
  - L1 ↔ I17  (sheet)
  - L1 ↔ V19  (sheet)
  - L1 ↔ E20  (sheet)
  - E2 ↔ I17  (sheet)
  - E2 ↔ V19  (sheet)
  - E2 ↔ E20  (sheet)
  - E2 ↔ Q22  (sheet)
  - G3 ↔ F16  (sheet)
  - G3 ↔ I17  (sheet)
  - G3 ↔ V19  (sheet)
  - G3 ↔ E20  (sheet)
  - G3 ↔ Q22  (sheet)
  - G3 ↔ D23  (sheet)
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - K4 ↔ I17  (sheet)
  - K4 ↔ V19  (sheet)
  - K4 ↔ E20  (sheet)
  - K4 ↔ Q22  (sheet)
  - K4 ↔ D23  (sheet)
  - … +50 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=231 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=139 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1422 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
