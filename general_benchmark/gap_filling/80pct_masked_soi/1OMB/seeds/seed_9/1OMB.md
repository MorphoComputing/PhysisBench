# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1OMB\seeds\seed_9\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 2.131 A
- tm_score_ca_ordered: 0.42283714797869737
- heavy_atom_rmsd: 4.216 A
- sidechain_heavy_atom_rmsd: 5.521 A
- **all-atom quality (honest):** heavy 4.216 A, sidechain 5.521 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 205
- bin_accuracy: 0.615

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=33
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=3.7247845725630175 -> 2.8869438198906 A
- topology_reconvergence: applied=True accepted=12/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.131084347508324
- ga_delta_rmsd: -0.17257737060029532  ga_fitness_mode: energy
- pre_local_rmsd: 2.131059820434488  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** A2 → 3 conflicts (60%)
- explained: 3/5 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.091), conflicts/hub=1.7, max_incompat=2.87Å, chain_span=0.939
- **fix-first:** [LOW_CONFLICT] Root cause(s): A2 — explain ~3/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C15** — severity 3.75, 3 conflict(s); suspect input ~`A2` (group: pull_in)
  - pull-in (wants closer): A2@6.3Å(now 9.7,conf 0.55)
  - R19↔A2: targets 4.4/6.3Å but partners are 13.6Å apart → too_far_apart by 2.9Å
  - G18↔A2: targets 5.0/6.3Å but partners are 13.8Å apart → too_far_apart by 2.5Å
  - P20↔A2: targets 5.2/6.3Å but partners are 13.0Å apart → too_far_apart by 1.5Å
- **I1** — severity 1.04, 1 conflict(s); suspect input ~`T13` (group: pull_in)
  - pull-in (wants closer): T13@6.9Å(now 10.0,conf 0.55)
  - D4↔T13: targets 7.2/6.9Å but partners are 16.0Å apart → too_far_apart by 1.9Å
- **C32** — severity 0.91, 1 conflict(s); suspect input ~`E3` (group: pull_in)
  - pull-in (wants closer): E3@8.1Å(now 11.1,conf 0.55)
  - G27↔E3: targets 12.8/8.1Å but partners are 22.6Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=5 · strand(E)=17 · 3-10(G)=8 · coil(C)=3

```
CGEEGGCGEEGECEEEHEEEEEEGEHHEGHGHE
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=1 · sheet=41
  - I26 ↔ C30  (helix)
  - E3 ↔ K14  (sheet)
  - E3 ↔ C15  (sheet)
  - E3 ↔ C16  (sheet)
  - T9 ↔ K14  (sheet)
  - T9 ↔ C15  (sheet)
  - T9 ↔ R19  (sheet)
  - T9 ↔ P20  (sheet)
  - T9 ↔ C21  (sheet)
  - T9 ↔ R22  (sheet)
  - T9 ↔ C23  (sheet)
  - T9 ↔ T28  (sheet)
  - W10 ↔ C15  (sheet)
  - W10 ↔ R19  (sheet)
  - W10 ↔ P20  (sheet)
  - W10 ↔ C21  (sheet)
  - W10 ↔ R22  (sheet)
  - W10 ↔ C23  (sheet)
  - W10 ↔ T28  (sheet)
  - G12 ↔ G18  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=104 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=47 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1443 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
