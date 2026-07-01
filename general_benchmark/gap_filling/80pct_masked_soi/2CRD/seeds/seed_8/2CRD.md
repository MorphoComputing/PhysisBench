# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2CRD\seeds\seed_8\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.603 A
- tm_score_ca_ordered: 0.4476113847153884
- heavy_atom_rmsd: 4.259 A
- sidechain_heavy_atom_rmsd: 5.221 A
- **all-atom quality (honest):** heavy 4.259 A, sidechain 5.221 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 216
- bin_accuracy: 0.625

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=11 rmsd=6.094600140020275 -> 4.541999026497098 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.6033233203889496
- ga_delta_rmsd: 1.6966710618281438  ga_fitness_mode: energy
- pre_local_rmsd: 2.6032741045218466  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** S4-T6 → 3 conflicts (75%)
- explained: 3/4 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.059), conflicts/hub=2.0, max_incompat=2.63Å, chain_span=0.412
- **fix-first:** [LOW_CONFLICT] Root cause(s): S4-T6 — explain ~3/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C11** — severity 2.43, 2 conflict(s); suspect input ~`L18` (group: push_out)
  - pull-in (wants closer): L18@10.4Å(now 13.4,conf 0.55)
  - push-out (wants farther): Y34@9.6Å(now 6.7,conf 0.55)
  - C5↔L18: targets 7.0/10.4Å but partners are 20.0Å apart → too_far_apart by 2.6Å
  - T6↔L18: targets 9.4/10.4Å but partners are 21.7Å apart → too_far_apart by 1.8Å
- **K25** — severity 2.40, 2 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): T1@11.1Å(now 7.1,conf 0.55), S4@10.8Å(now 6.8,conf 0.55)
  - R32↔T1: targets 4.4/11.1Å but partners are 4.5Å apart → too_close_together by 2.2Å
  - C31↔S4: targets 5.4/10.8Å but partners are 3.2Å apart → too_close_together by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=16 · 3-10(G)=4 · coil(C)=1

```
EEEEEHEHHCHEHHHHHHHGEGEEEEEHHEGEGE
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=2 · sheet=36
  - C11 ↔ C15  (helix)
  - C15 ↔ H19  (helix)
  - T1 ↔ W12  (sheet)
  - T1 ↔ T21  (sheet)
  - N2 ↔ W12  (sheet)
  - V3 ↔ W12  (sheet)
  - V3 ↔ R23  (sheet)
  - S4 ↔ W12  (sheet)
  - S4 ↔ R23  (sheet)
  - S4 ↔ G24  (sheet)
  - C5 ↔ W12  (sheet)
  - C5 ↔ R23  (sheet)
  - C5 ↔ G24  (sheet)
  - C5 ↔ K25  (sheet)
  - T7 ↔ W12  (sheet)
  - T7 ↔ R23  (sheet)
  - T7 ↔ G24  (sheet)
  - T7 ↔ K25  (sheet)
  - T7 ↔ C26  (sheet)
  - W12 ↔ T21  (sheet)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=147 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=83 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5167 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
