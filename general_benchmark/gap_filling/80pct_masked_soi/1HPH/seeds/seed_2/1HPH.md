# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HPH\seeds\seed_2\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 5.217 A
- tm_score_ca_ordered: 0.30071520588444633
- heavy_atom_rmsd: 6.379 A
- sidechain_heavy_atom_rmsd: 7.021 A
- **all-atom quality (honest):** heavy 6.379 A, sidechain 7.021 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 235
- bin_accuracy: 0.651

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.216546010325873
- ga_delta_rmsd: -0.7486595737113708  ga_fitness_mode: energy
- pre_local_rmsd: 5.216503521057682  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.057), conflicts/hub=1.0, max_incompat=3.15Å, chain_span=0.029
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R19** — severity 1.74, 1 conflict(s); suspect input ~`V34` (group: push_out)
  - push-out (wants farther): V34@18.5Å(now 15.0,conf 0.55)
  - R24↔V34: targets 9.8/18.5Å but partners are 5.5Å apart → too_close_together by 3.1Å
- **V20** — severity 0.96, 1 conflict(s); suspect input ~`F33` (group: push_out)
  - push-out (wants farther): F33@17.9Å(now 14.8,conf 0.55)
  - R24↔F33: targets 10.0/17.9Å but partners are 6.1Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=15 · 3-10(G)=4 · coil(C)=4

```
EEEHHEHEEECGGGEHEHHHEHEHEEHEECGCHHC
```

## Backbone H-bond Network

- total=22 · helix(i→i+4)=3 · sheet=19
  - S16 ↔ V20  (helix)
  - E18 ↔ W22  (helix)
  - V20 ↔ R24  (helix)
  - V1 ↔ L6  (sheet)
  - V1 ↔ H8  (sheet)
  - V1 ↔ N9  (sheet)
  - S2 ↔ H8  (sheet)
  - S2 ↔ N9  (sheet)
  - S2 ↔ L10  (sheet)
  - E3 ↔ H8  (sheet)
  - E3 ↔ N9  (sheet)
  - E3 ↔ L10  (sheet)
  - H8 ↔ N15  (sheet)
  - N9 ↔ N15  (sheet)
  - L10 ↔ N15  (sheet)
  - N15 ↔ E21  (sheet)
  - M17 ↔ L23  (sheet)
  - E21 ↔ K26  (sheet)
  - E21 ↔ Q28  (sheet)
  - E21 ↔ D29  (sheet)
  - … +2 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=94 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=11 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3061 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
