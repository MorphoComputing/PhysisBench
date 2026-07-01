# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CRN\seeds\seed_1\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 6.191 A
- tm_score_ca_ordered: 0.25027958044098503
- heavy_atom_rmsd: 7.091 A
- sidechain_heavy_atom_rmsd: 7.828 A
- **all-atom quality (honest):** heavy 7.091 A, sidechain 7.828 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 327
- bin_accuracy: 0.731

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.190799078053775
- ga_delta_rmsd: -1.0639921387539157  ga_fitness_mode: energy
- pre_local_rmsd: 6.242411790008179  localized_anchor_rmsd: 6.190851254731436

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.045), conflicts/hub=1.0, max_incompat=2.12Å, chain_span=0.114
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R16** — severity 1.15, 1 conflict(s); suspect input ~`T1` (group: pull_in)
  - pull-in (wants closer): T1@11.9Å(now 14.8,conf 0.55)
  - G19↔T1: targets 5.0/11.9Å but partners are 19.0Å apart → too_far_apart by 2.1Å
- **P21** — severity 0.94, 1 conflict(s); suspect input ~`G36` (group: pull_in)
  - pull-in (wants closer): G36@18.2Å(now 22.1,conf 0.55)
  - P18↔G36: targets 9.4/18.2Å but partners are 29.3Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=19 · 3-10(G)=5 · coil(C)=5

```
CEHEEEGHHHEHHGGEEHEEEEHHHGHHHECCEGEEEECEHEHC
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=3 · sheet=14
  - A8 ↔ F12  (helix)
  - A23 ↔ T27  (helix)
  - C25 ↔ T29  (helix)
  - C2 ↔ N11  (sheet)
  - P4 ↔ N11  (sheet)
  - S5 ↔ N11  (sheet)
  - I6 ↔ N11  (sheet)
  - N11 ↔ R16  (sheet)
  - N11 ↔ L17  (sheet)
  - N11 ↔ G30  (sheet)
  - R16 ↔ P21  (sheet)
  - R16 ↔ E22  (sheet)
  - R16 ↔ G30  (sheet)
  - E22 ↔ G30  (sheet)
  - E22 ↔ I33  (sheet)
  - G30 ↔ D42  (sheet)
  - I33 ↔ T38  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=147 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=48 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8636 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
