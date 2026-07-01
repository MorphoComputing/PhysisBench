# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1FKF\seeds\seed_0\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 1.640 A
- tm_score_ca_ordered: 0.8870257650685465
- heavy_atom_rmsd: 3.080 A
- sidechain_heavy_atom_rmsd: 3.799 A
- **all-atom quality (honest):** heavy 3.080 A, sidechain 3.799 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 3511
- bin_accuracy: 0.844

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=1.7718399549175035 -> 1.643637408484418 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.639754826410905
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.642223478672787  localized_anchor_rmsd: 1.639777856918563

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** V54-I55 → 4 conflicts (57%); W58-E60 → 3 conflicts (43%)
- explained: 7/7 conflicts by 2 root cause(s)
- metrics: hubs=4 (frac 0.038), conflicts/hub=1.8, max_incompat=2.44Å, chain_span=0.057
- **fix-first:** [LOW_CONFLICT] Root cause(s): V54-I55 + W58-E60 — explain ~7/7 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V54** — severity 1.45, 2 conflict(s); suspect input ~`Y81` (group: push_out)
  - push-out (wants farther): P92@17.4Å(now 14.4,conf 0.36), A83@16.8Å(now 13.3,conf 0.35), P87@16.3Å(now 10.9,conf 0.35), T84@15.8Å(now 12.0,conf 0.34), G85@13.9Å(now 11.3,conf 0.34)
  - P92↔Y81: targets 17.4/10.2Å but partners are 4.8Å apart → too_close_together by 2.4Å
  - A83↔Y81: targets 16.8/10.2Å but partners are 4.7Å apart → too_close_together by 1.8Å
- **W58** — severity 1.32, 2 conflict(s); suspect input ~`A80` (group: push_out)
  - push-out (wants farther): T84@17.8Å(now 15.0,conf 0.36), A83@17.6Å(now 14.9,conf 0.36)
  - A83↔A80: targets 17.6/8.3Å but partners are 7.3Å apart → too_close_together by 2.0Å
  - I55↔T84: targets 5.9/17.8Å but partners are 10.2Å apart → too_close_together by 1.8Å
- **E60** — severity 1.22, 2 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): R12@17.1Å(now 14.3,conf 0.35)
  - A63↔R12: targets 5.8/17.1Å but partners are 9.6Å apart → too_close_together by 1.8Å
  - Q64↔R12: targets 7.0/17.1Å but partners are 8.4Å apart → too_close_together by 1.7Å
- **I55** — severity 0.53, 1 conflict(s); suspect input ~`A83` (group: push_out)
  - push-out (wants farther): G88@17.3Å(now 13.2,conf 0.35), P87@15.2Å(now 11.6,conf 0.34), A83@13.6Å(now 10.6,conf 0.34), T84@13.3Å(now 10.2,conf 0.34)
  - Y81↔A83: targets 7.4/13.6Å but partners are 4.7Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=34 · 3-10(G)=29 · coil(C)=10

```
CEGGGHEEECGHHEEECHECGCECEGEGGHHHEGHEEHHHGHEGGEEGGHEHHEEHHHHHHHHHEEGGEGECGGGEHHHEHHEGGEHCCEEGHEGGGGCGEGHEE
```

## Backbone H-bond Network

- total=44 · helix(i→i+4)=12 · sheet=32
  - D31 ↔ F35  (helix)
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - Q52 ↔ R56  (helix)
  - E53 ↔ G57  (helix)
  - R56 ↔ E60  (helix)
  - G57 ↔ G61  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - E60 ↔ Q64  (helix)
  - P77 ↔ Y81  (helix)
  - D78 ↔ G82  (helix)
  - P8 ↔ F14  (sheet)
  - G9 ↔ F14  (sheet)
  - G9 ↔ P15  (sheet)
  - F14 ↔ Q19  (sheet)
  - P15 ↔ V23  (sheet)
  - V23 ↔ S37  (sheet)
  - V23 ↔ K43  (sheet)
  - Y25 ↔ D36  (sheet)
  - … +24 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=54 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=436 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=254 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0002 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1FKF.ensemble.pdb`)
- RMSF mean=0.267Å max=0.912Å (per-residue in .per_residue.csv)
- most flexible residues: 87, 92, 12, 11, 91

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1FKF.pae.csv`
- mean=0.141Å · max=1.086Å · AlphaFold-PAE analog (low block = rigid unit/domain)
